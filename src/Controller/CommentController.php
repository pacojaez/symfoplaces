<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;

use App\Entity\Comment;
use App\Entity\Place;
use App\Form\CommentFormType;

use Doctrine\ORM\EntityManagerInterface;

class CommentController extends AbstractController
{
    #[Route('/comment', name: 'comment')]
    public function index(): Response {
        return $this->render('comment/index.html.twig', [
            'controller_name' => 'CommentController',
        ]);
    }

    #[Route('/comment/create', name: 'comment_create', methods: ['POST'])]
    public function create( Request $request ): Response {

        $user = $this->getUser();
        $place = $this->getDoctrine()->getRepository( Place::class )->find($request->get('place_id'));
        $content = $request->get('content');
        $comment = new Comment();

        // $commentFormulario = $this->createForm( CommentFormType::class, $comment );

        // $commentFormulario->handleRequest( $request );

        // if( $commentFormulario->isSubmitted() && $commentFormulario->isValid()){

            $comment->setUser( $user );
            $comment->setPlace ( $place );
            // $comment->addPlace ( $place );
            $comment->setContent($content);

            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist( $comment );
            $entityManager->flush();

            $mensaje = "Comentario añadido correctamente al lugar";
            $this->addFlash( 'success', $mensaje );

            return $this->redirectToRoute('place_show', [
                'id' => $place->getId(),
            ]);
        // }
        
        // return $this->render('comment/form.html.twig', [
            // 'commentFormulario' => $commentFormulario->createView(),
        // ]);
    }

    #[Route('/comment/delete', name: 'comment_delete', methods: ['GET','POST'])]
    public function delete( Request $request, EntityManagerInterface $em ): Response {
        
        $comment = $em->getRepository( Comment::class )->find( $request->get('id'));
        $place = $comment->getPlace();

        $this->denyAccessUnlessGranted('delete', $comment );

        $em->remove( $comment );
        $em->flush();

        $mensaje = "Comentario borrado correctamente del lugar";
        $this->addFlash( 'success', $mensaje );

        return $this->redirectToRoute('place_show', [
            'id' => $place->getId(),
        ]);
    }
}
