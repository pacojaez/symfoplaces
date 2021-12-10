<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use App\Services\FileService;
use App\Form\PhotoFormType;
use App\Form\PhotoEditFormType;

use App\Entity\Photo;
use App\Entity\Place;
use Doctrine\ORM\EntityManagerInterface;

class PhotoController extends AbstractController
{
    #[Route('/photo', name: 'photo')]
    public function index(): Response
    {
        return $this->render('photo/index.html.twig', [
            'controller_name' => 'PhotoController',
        ]);
    }

    #[Route('/photo/create', name: 'photo_create')]
    public function create( Request $request, FileService $uploader, EntityManagerInterface $em ){
        
        $photo = new Photo();
        $place = $em->getRepository( Place::class )->find( $request->get('id'));
        $photo->setPlace($place);

        $this->denyAccessUnlessGranted('create', $photo );

        $formulario = $this->createForm( PhotoFormType::class, $photo );

        //guardando la pelicula cuando llega el form
        $formulario->handleRequest($request);

        if($formulario->isSubmitted() && $formulario->isValid()){

            $file = $formulario->get('ruta')->getData();

            // $file = $formulario->get('portrait')->getData();

            if( $file ){
                // $extension = $file->guessExtension();
                // $directorio = $this->getParameter('app.covers_root');
                // $fichero = uniqid().".$extension";
                // $file->move($directorio, $fichero);
                // $peli->setCaratula($fichero);
                $uploader->targetDirectory = $this->getParameter('app.places_root');
                $photo->setRuta($uploader->upload($file));       // pasamos a tener una sola linea de código en vez de 5 tras implementar el servicio
            }

            
            $id = $place->getId();
            $photo->setPlace( $place );
        
            // $photo->setPlace();
            $em->getRepository( Photo::class);
            $em->persist( $photo );
            $em->flush();

            // $nombre = $request->request->all();
            // $nombre = $request->query->all()['actor_form']['nombre'];
            // $nombre = $request->get('actor_form')['nombre'];

            $this->addFlash('success', 'Foto añadida correctamente');

            return $this->redirectToRoute('place_edit', [
                'id' => $id
            ]);
        }

        return $this->render('photo/create.html.twig', [
            'formulario' => $formulario->createView()
        ]);
    }

    #[Route('/photo/delete/{id}', name: 'photo_delete', methods:["GET"])]
    public function delete( Photo $photo, Request $request, FileService $uploader, EntityManagerInterface $em ): Response {

        $this->denyAccessUnlessGranted('edit', $photo);

        $id = $photo->getPlace()->getId();
        // dd($id);

        $uploader->targetDirectory = $this->getParameter('app.places_root');

        if ( !$uploader->remove($photo->getRuta())){
            $this->addFlash( 'success', 'Imagen borrada del sistema de archivos correctamente' );
        }else{
            $this->addFlash( 'warning', 'Imagen no borrada' );
        }

        $em->remove($photo);
        
        if( $em->flush())
                $this->addFlash( 'success', 'Imagen borrada de la Base de Datos correctamente' );

        return $this->redirectToRoute('place_edit', ['id'=>$id]);

    }


    #[Route('/photo/edit/{id}', name: 'photo_edit', methods: ['GET', 'POST'])]
    public function edit( Photo $photo, Request $request, EntityManagerInterface $em ): Response {

        $this->denyAccessUnlessGranted('edit', $photo);

        $formulario = $this->createForm( PhotoEditFormType::class, $photo );

        $place = $photo->getPlace();

        $formulario->handleRequest( $request );

        if($formulario->isSubmitted() && $formulario->isValid()){
            
            $em->getRepository(Photo::class);
            $em->flush();

            $mensaje = "Foto ".$photo->getTitle()." con id: ".$photo->getId()." actualizada correctamente";
            $this->addFlash( 'success', $mensaje );

            return $this->redirectToRoute('place_edit', [
                'id' => $photo->getPlace()->getId()
            ]);
        
        }

        $formularioEdit = $this->createForm(PhotoEditFormType::class, NULL, [
            'action' => $this->generateUrl('photo_edit', [
            'id' =>$photo->getId()
            ])
        ]);

        return $this->render('photo/edit.html.twig', [
            'formularioEdit' => $formulario->createView(),
            'place' => $place,
            'photo' => $photo
        ]);

    }
}
