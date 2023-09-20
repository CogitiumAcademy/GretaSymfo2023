<?php

namespace App\Controller\Admin;

use App\Entity\Post;
use App\Form\Post2Type;
use App\Repository\PostRepository;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

#[Route('/admin/post', name: 'admin_post_')]
class PostController extends AbstractController
{
    #[Route('/', name: 'index')]
    public function index(PostRepository $postRepository): Response
    {
        $posts = $postRepository->findAll();
        //dd($categories);

        return $this->render('admin/post/index.html.twig', [
            'posts' => $posts,
        ]);
    }

    #[Route('/update/{id}', name: 'update')]
    public function updatePost(Post $post, Request $request, ManagerRegistry $doctrine): Response
    {
        $form = $this->createForm(Post2Type::class, $post);

        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            $em = $doctrine->getManager();
            $em->flush();
            return $this->redirectToRoute('admin_post_index');
        }

        return $this->render('admin/post/add.html.twig', [
            'form' => $form->createView(),
            'h1' => 'Modifier un article'
        ]);
    }

    #[Route('/activate/{id}', name: 'activate')]
    public function activate(Post $post, ManagerRegistry $doctrine): Response
    {
        $post->setActive(($post->isActive()) ? false : true);
        $em = $doctrine->getManager();
        $em->flush();
        return new Response("true");
    }
}
