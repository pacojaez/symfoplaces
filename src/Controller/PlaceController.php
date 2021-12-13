<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use Doctrine\ORM\EntityManager;
use Doctrine\ORM\EntityManagerInterface;

use App\Entity\Place;
use App\Entity\Photo;
use App\Entity\Comment;
use App\Form\CommentFormType;   
use App\Form\PhotoFormType;  
use App\Form\PlaceDeleteFormType;
use App\Entity\User;
use App\Services\FileService;
use App\Services\SimpleSearchService;
use App\Services\PaginatorService;
use App\Form\SearchFormType;

use App\Form\PlaceFormType;

use Psr\Log\LoggerInterface;

class PlaceController extends AbstractController
{
    #[Route('/portada/{pagina}', name: 'portada', defaults:['pagina'=> 1 ])]
    public function portada( EntityManagerInterface $em, PaginatorService $paginator, int $pagina  ): Response
    {
        // $places = $em->getRepository(Place::class)->findAll();
        $paginator->setEntityType('App\Entity\Place');
        
        $places = $paginator->findAllEntities( $pagina ); 
        
        // array_filter( $places, function( $place){
        //     return ($place->getPhotos() != []);
        // });
        // dd($places);
        // foreach($places as $place){
        //     if( !$place->getPhotos())
        //         unset($places, $place);
        //     // foreach($fotos as $foto){
        //     //     dd($foto);
        //     // }
        // }

        return $this->render('place/portada.html.twig', [
            'places' => $places,
            'totalPaginas' => $paginator->getTotalPages(),
            'totalItems' => $paginator->getTotalItems(),
            'paginaActual' => $pagina,
            'entidad' => 'Places',
        ]);
    }

    #[Route('/allplaces/{pagina}', name: 'all_places', defaults:['pagina'=> 1 ])]
    public function allPlaces(int $pagina, EntityManagerInterface $em, PaginatorService $paginator  ): Response
    {
        $paginator->setEntityType('App\Entity\Place');
        
        $places = $paginator->findAllEntities( $pagina );
        
        return $this->render('place/allplaces.html.twig', [
            'places' => $places,
            'totalPaginas' => $paginator->getTotalPages(),
            'totalItems' => $paginator->getTotalItems(),
            'paginaActual' => $pagina,
            'entidad' => 'Places',
        ]);
    }

    #[Route('/place/create', name: 'place_create')]
    public function create( Request $request, EntityManagerInterface $em, LoggerInterface $appInfoLogger ): Response {

        $place = new Place();

        // $this->denyAccessUnlessGranted('create', $place);
        $formulario = $this->createForm( PlaceFormType::class, $place );

        //guardando la pelicula cuando llega el form
        $formulario->handleRequest($request);

        if($formulario->isSubmitted() && $formulario->isValid()){

            // establece el usuario que ha creado la pelicula
            $place->setUser($this->getuser());
            $place->setCreatedAt(new \DateTime());

            $em->getRepository(Place::class);
            $em->persist( $place );
            $em->flush();

            $mensaje = "Lugar ".$place->getTitulo()." con id: ".$place->getId()." guardado correctamente";
            $this->addFlash( 'success', $mensaje );
            $appInfoLogger->info( $mensaje );

            return $this->redirectToRoute('place_edit', [
                'id' => $place->getId()
            ]);
        }

        return $this->render('place/create.html.twig', [
            'formulario' => $formulario->createView()
        ]);

    }

    #[Route('/place/edit/{id}', name: 'place_edit')]
    public function edit( Place $place, Request $request, EntityManagerInterface $em ): Response {

        $this->denyAccessUnlessGranted('edit', $place);

        $formulario = $this->createForm( PlaceFormType::class, $place );

        $formulario->handleRequest( $request );

        if($formulario->isSubmitted() && $formulario->isValid()){
   
            $em->getRepository(Place::class);
            $em->flush();

            $mensaje = "Lugar ".$place->getTitulo()." con id: ".$place->getId()." actualizado correctamente";
            $this->addFlash( 'success', $mensaje );
            $appInfoLogger->info( $mensaje );

            return $this->redirectToRoute('place_edit', [
                'id' => $place->getId()
            ]);
        
        }

        $formularioAddPhoto = $this->createForm(PhotoFormType::class, NULL, [
            'action' => $this->generateUrl('photo_create', [
            'id' =>$place->getId()
            ])
        ]);

        return $this->render('place/edit.html.twig', [
            'formulario' => $formulario->createView(),
            'formularioAddPhoto' => $formularioAddPhoto->createView(),
            'place' => $place
        ]);

    }

    #[Route('/place/delete/{id}', name: 'place_delete')]
    public function delete( Place $place, Request $request, EntityManagerInterface $em, FileService $uploader ): Response {

        $this->denyAccessUnlessGranted('delete', $place);

        $formulario = $this->createForm( PlaceDeleteFormType::class, $place );

        $formulario->handleRequest($request);

        if($formulario->isSubmitted() && $formulario->isValid()){

            //recogemos todas las fotos asociadas al lugar
            $fotos = $place->getPhotos();
            //asignamos las variables para trabajar con fotos
            $uploader->targetDirectory = $this->getParameter('app.places_root');
            $em->getRepository(Photo::class);
            // recorremos el array de fotos
            foreach ($fotos as $foto){
                //eliminamos cada foto del sistema de archivos
                $uploader->remove($foto->getRuta());
                //eliminamos cada foto de la DB
                $em->remove($foto);
            }
            // eliminamos de la DB el place
            $em->getRepository( Place::class );
            $em->remove($place);
            $em->flush();
    
            $mensaje = "Lugar y fotos asociadas ".$place->getTitulo()." borrados correctamente";
            $this->addFlash( 'success', $mensaje );
            $appInfoLogger->info( $mensaje );
    
            return $this->redirectToRoute('all_places');

        }

        return $this->render('place/delete.html.twig', [
            'formulario'=>$formulario->createView(),
            'place' => $place
        ]);
       
    }

    #[Route('/place/show/{id}', name: 'place_show')]
    public function show( Place $place, EntityManagerInterface $em ): Response {

        $place =  $em->getRepository( Place::class )->find($place);

        if(!$place)
            throw $this->createNotFoundException( "No se encontró un lugar con id: $place." );

        // FORMULARIO DE COMENTARIOS:
        $comment = new Comment();
        $commentsForm = $this->createForm( CommentFormType::class, $comment );

        if( $commentsForm->isSubmitted() && $commentsForm->isValid()){

            $comment->setUser( $this->getuser() );
            $comment->addPlace( $place );

            $em->getRepository( Place::class );
            $em->persist( $comment );
            $em->flush();

            $mensaje = "Comentario añadido correctamente al lugar ".$place->getTitulo();
            $this->addFlash( 'success', $mensaje );

            return $this->redirectToRoute('all_places', [
                'id' => $comment->getPlace()->id,
            ]);
        }

        $comments = $place->getComments();

        return $this->render('place/show.html.twig', [
            'place' => $place,
            'commentsForm' => $commentsForm->createView(),
            'comments' => $comments,
        ]); 
    }

    #[Route('/place/search', name: 'searchplace', methods: ['GET', 'POST'] )]
    public function search ( Request $request, SimpleSearchService $busqueda, LoggerInterface $appSearchLogger ): Response {

        $formulario = $this->createForm( SearchFormType::class, $busqueda, [
            'field_choices' => [
                'Lugar' => 'titulo',
                'Pais' => 'country',
                'Ciudad' => 'city',
                'Descripción' => 'text'
            ],
            'order_choices' => [
                'Id' => 'id',
                'Lugar' => 'titulo',
                'Pais' => 'country',
                'Ciudad' => 'city',
            ]
        ]);

        $formulario->get('valor')->setData($busqueda->campo);
        $formulario->get('orden')->setData($busqueda->orden);

        $formulario->handleRequest( $request );

        $places = $busqueda->search( 'App\Entity\Place');

        // $valor = $request->request->get('valor');
        // // $valor = $formulario->get('valor')->setData($busqueda->valor);
        // dd($request);
        $appSearchLogger->info( "Se ha buscado el término: ".$formulario->get('valor')->getData(). " en el campo ".$formulario->get('campo')->getData());

        return $this->renderForm('place/searchform.html.twig', [
            'formulario' => $formulario,
            'places' => $places
        ]);
    }

    /**
     * @Route("/searchlogs", name="searchlogs")
     */
    public function searchlogs(): Response {

        // "[2021-11-03T15:22:50.601744+00:00] app_search.INFO: Se ha buscado el término: Peter [] []" //linea que es guardada en el log de search
        if( file_exists('..\var\log\appsearch.log')){           //evita error de que no exista el archivo

            $logs = file('..\var\log\appsearch.log');
            $resultado = [];

            foreach( $logs as $log ){
                $logLimpio = str_replace('[]', ' ', $log);
                $terminoBusqueda = substr( $logLimpio, 1, 10);
                $terminoBusqueda .= ': '.substr( $logLimpio, 79, (strlen($logLimpio)) );
                array_push( $resultado, $terminoBusqueda );

                //TODO contar el numero de busquedas de cada término y añadirlo a la vista
            }

            return $this->render('user/admin/searchlogs.html.twig', [
                'resultado' => array_reverse($resultado),
            ]);
        }else{
            return $this->render('user/admin/searchlogs.html.twig', [
                'resultado' => [],
            ]);

        }
    
    }
}