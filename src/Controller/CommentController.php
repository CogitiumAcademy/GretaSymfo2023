<?php

namespace App\Controller;

use App\Entity\Comment;
use App\Form\CommentType;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Security\Csrf\CsrfToken;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Csrf\CsrfTokenManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

#[Route('/comment', name: 'comment_')]
class CommentController extends AbstractController
{
    #[Route('/delete/{id}', name: 'delete')]
    public function commentDelete(Comment $comment, ManagerRegistry $doctrine, Request $request, CsrfTokenManagerInterface $csrfTokenManager): Response
    {
        //dd($comment->getPost()->getSlug());
        $token = new CsrfToken('delete', $request->query->get('_csrf_token'));
        if ($csrfTokenManager->isTokenValid($token)) {
            $em = $doctrine->getManager();
            $em->remove($comment);
            $em->flush();
            $this->addFlash('success', 'Commentaire supprimé !');
        } else {
            $this->addFlash('danger', 'Token absent ou invalide !');
        }
        return $this->redirectToRoute('post_view', array('slug' => $comment->getPost()->getSlug()));

    }

    #[Route('/edit/{id}', name: 'edit')]
    public function commentEdit(Comment $comment, ManagerRegistry $doctrine, Request $request): Response
    {
        //dd($comment);
        $form = $this->createForm(CommentType::class, $comment);

        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            $em = $doctrine->getManager();
            $em->flush();
            $this->addFlash('success', 'Commentaire modifié !');
            return $this->redirectToRoute('post_view', array('slug' => $comment->getPost()->getSlug()));
        }

        return $this->render('comment/edit.html.twig', [
            'form' => $form->createView(),
        ]);

    }

}
