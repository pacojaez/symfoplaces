<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;

use Symfony\Component\HttpFoundation\BinaryFileResponse;
use Symfony\Component\HttpFoundation\ResponseHeaderBag;

use App\Services\FileService;
use App\Services\PaginatorService;

use Doctrine\ORM\EntityManagerInterface;

use App\Entity\Place;
use App\Entity\Photo;
use App\Entity\Comment;
use App\Entity\User;
use App\Form\UserUpdateFormType;
use App\Form\UserDeleteFormType;
use Doctrine\ORM\EntityManager;

use Psr\Log\LoggerInterface;

class UserController extends AbstractController
{
    #[Route('/user', name: 'user')]
    public function index(): Response
    {
        return $this->render('user/index.html.twig', [
            'controller_name' => 'UserController',
        ]);
    }

    #[Route('/home', name: 'home')]
    public function home( ): Response
    {
        $this->denyAccessUnlessGranted('IS_AUTHENTICATED_FULLY');

        return $this->render('user/home.html.twig');
    }

    #[Route('/user/pic/{avatar}', name: 'pic_show', methods: ['GET']) ]
    public function showPic( string $avatar ): Response
    {
        $this->denyAccessUnlessGranted('IS_AUTHENTICATED_FULLY');

        $ruta = $this->getParameter('app.users_pics_root');

        $response = new BinaryFileResponse( $ruta.'/'.$avatar );
        $response->trustXSendfileTypeHeader();
        $response->setContentDisposition(
            ResponseHeaderBag::DISPOSITION_INLINE,
            $avatar,
            iconv('UTF-8', 'ASCII//TRANSLIT', $avatar )
        );
        
        return $response;
    }

    #[Route('/user/edit/{id}', name: 'user_edit', methods: ['GET', 'POST'])]
    public function update( Request $request, FileService $uploader, EntityManagerInterface $em ): Response {

        $id = $request->get('id');
        
        $user = $em->getRepository( User::class )->find($id);
        $this->denyAccessUnlessGranted('edit', $user );

        $fichero = $user->getAvatar();
        // dd($fichero);
        
        $formulario = $this->createForm( UserUpdateFormType::class, $user );
        $formulario->handleRequest($request);

        if ($formulario->isSubmitted() && $formulario->isValid()) {

            $file = $formulario->get('avatar')->getData();

            if($file){

                $uploader->targetDirectory = $this->getParameter('app.users_pics_root');

                $fichero = $uploader->replace( $file, $fichero);

                $this->addFlash('success', 'Avatar correctamente cambiado');

            }

            $user->setAvatar($fichero);
            $em->flush();

            // $this->container->get('security.token_storage')->setToken(NULL);
            // $this->container->get('session')->invalidate();

            $mensaje = "Usuario ".$user->getName()." actualizado correctamente";
            $this->addFlash('success', $mensaje);

            // $mensaje = "El Usuario ".$user->getName()." se ha dado de baja";
            // $appUserLogger->warning($mensaje);

            $userLogeado = $this->getUser();
            
            if( in_array('ROLE_ADMIN', $userLogeado->getRoles(), true) ){
                return $this->redirectToRoute('all_users');
            }

            return $this->redirectToRoute('home');
        }
        
        return $this->renderForm('user/edit.html.twig', [
            'formulario' => $formulario,
            'user' => $user,
        ]);
    }

    #[Route('/unsubscribe', name: 'unsubscribe', methods: ['GET', 'POST'])]
    public function unsubscribe( Request $request, FileService $uploader, EntityManagerInterface $em ): Response {

        $user = $this->getUser();
        $formulario = $this->createForm( UserDeleteFormType::class, $user );
        $formulario->handleRequest($request);

        
        $places = $user->getPlaces();
        $em->getRepository(Place::class);
            foreach( $places as $place ){
                $place->setUser( NULL );
                $em->flush();
            }

        if ($formulario->isSubmitted() && $formulario->isValid()) {

            $uploader->targetDirectory = $this->getParameter('app.users_pics_root');

            if( $user->getAvatar())
                $uploader->remove($user->getAvatar());

            $em->getRepository(User::class); 
            $em->remove($user);
            $em->flush(); 

            $this->container->get('security.token_storage')->setToken(NULL);
            $this->container->get('session')->invalidate();

            $mensaje = "Usuario ".$user->getName()." borrado correctamente";
            $this->addFlash('success', $mensaje);

            $mens = "El Usuario ".$user->getName()." se ha dado de baja";
            $appUserLogger->warning($mens);

            return $this->redirectToRoute('portada');
        }
        
        return $this->renderForm('user/delete.html.twig', [
            'formulario' => $formulario,
            'user' => $user
        ]);
    }

    #[Route('/user/deleteimage/{id}', name: 'user_delete_image', methods:["GET"])]
    public function deleteimage( User $user, Request $request, FileService $uploader, EntityManagerInterface $em ): Response {
   
            $uploader->targetDirectory = $this->getParameter('app.users_pics_root');
            $uploader->remove( $user->getAvatar() );
            

            if( !$uploader->get( $user->getAvatar()) ){
                $mensaje = "Imagen borrada correctamente";
                $this->addFlash('success', $mensaje);
            }else{
                $mensaje = "Imagen no borrada correctamente";
                $this->addFlash('warning', $mensaje);
            }

            $user->setAvatar(NULL);
            $em->flush();

            $userLogeado = $this->getUser();

            if( in_array('ROLE_ADMIN', $userLogeado->getRoles(), true) ){
                return $this->redirectToRoute('all_users');
            }

        return $this->redirectToRoute( 'home' );

    }

    /**
     * @Route("/user/show/{id}", name="user_show")
     * 
     * metodo show hecho de forma "tradicional"
     */
    public function show( User $user, EntityManagerInterface $em ): Response {

        $em->find('App\Entity\User', $user);

        // $this->denyAccessUnlessGranted('show', $user);

        if(!$user)
            throw $this->createNotFoundException( "No se encontr?? el usuario con id: $user." );

        return $this->render('user/show.html.twig', [
            'user' => $user,
        ]); 
    }

    #[Route('/allusers/{pagina}', name: 'all_users', defaults: ['pagina'=> 1], methods: ['GET'] )]
    public function allusers( int $pagina,  PaginatorService $paginator ): Response {
        
        $user = $this->getUser();
        $this->denyAccessUnlessGranted('create', $user);

        $paginator->setEntityType('App\Entity\User');
        
        $users = $paginator->findAllEntities( $pagina );
        
        return $this->render('user/allusers.html.twig', [
            'users' => $users,
            'totalPaginas' => $paginator->getTotalPages(),
            'totalItems' => $paginator->getTotalItems(),
            'paginaActual' => $pagina,
            'entidad' => 'Usuarios'
        ]);
    }

    #[Route('/user/delete/{id}', name:'user_delete')]
    public function delete( User $user, Request $request, FileService $uploader, EntityManagerInterface $em, LoggerInterface $appUserLogger ): Response {

        $this->denyAccessUnlessGranted('create', $user);

        $formulario = $this->createForm( UserDeleteFormType::class, $user );
        $formulario->handleRequest($request);

        $places = $user->getPlaces();
        $em->getRepository(Place::class);
        foreach( $places as $place ){
            $place->setUser( NULL );
            $em->flush();
        }
        
        $comments = $user->getComments();
        $em->getRepository(Comment::class);
        foreach( $comments as $comment ){
            $em->remove($comment);
            $em->flush();
        }

            if ($formulario->isSubmitted() && $formulario->isValid()) {

                $uploader->targetDirectory = $this->getParameter('app.users_pics_root');
    
                if( $user->getAvatar())
                    $uploader->remove($user->getAvatar());
    
                $em->getRepository(User::class); 
                $em->remove($user);
                $em->flush(); 
    
                // $this->container->get('security.token_storage')->setToken(NULL);
                // $this->container->get('session')->invalidate();
    
                $mensaje = "Usuario ".$user->getName()." borrado correctamente";
                $this->addFlash('success', $mensaje);
                $appUserLogger->warning($mensaje);

                $userLogeado = $this->getUser();
    
                if( in_array('ROLE_ADMIN', $userLogeado->getRoles(), true) ){
                    return $this->redirectToRoute('all_users');
                }
            
                return $this->redirectToRoute('portada');

            }

        return $this->renderForm('user/delete.html.twig', [
            'formulario' => $formulario,
            'user' => $user
        ]);
    }

    /**
     * @Route("/usersactions", name="usersactions")
     */
    public function userslogs(): Response {

        // [2021-11-18T10:40:58.445222+01:00] app_user.INFO: Usuario nuevo registrado. Pendiente de verificar. Email: pacojaez@gmail.com [] [] //linea que es guardada en el log de search
        if( file_exists('..\var\log\appusers.log')){           //evita error de que no exista el archivo

            $logs = file('..\var\log\appusers.log');
            $resultado = [];

            foreach( $logs as $log ){
                // dd($log);
                $verified = '';
                $logLimpio = str_replace('[]', ' ', $log);
                $userAction = substr( $logLimpio, 1, 19);
                $userAction .= ': '.substr( $logLimpio, 50, (strlen($logLimpio)) );
                if ( strstr( $log, 'INFO' ) ) {
                    $status = 'Verificado';
                  } elseif  (strstr( $log, 'NOTICE' )){
                    $status = 'Registrado';
                  } elseif (strstr( $log, 'WARNING' )){
                    $status = 'Baja';
                  }else{
                    $status = '';
                  }
                array_push( $resultado, ['action' => $userAction, 'status'=>$status] );

                //TODO poner fondo distinto si es registro o verificaci??n o baja
            }

            return $this->render('user/admin/usersAction.html.twig', [
                'resultado' => array_reverse($resultado),
            ]);
        }else{
            return $this->render('user/admin/usersAction.html.twig', [
                'resultado' => [],
            ]);

        }
    
    }
}
