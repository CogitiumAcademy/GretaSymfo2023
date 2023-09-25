<?php

namespace App\Controller;

use App\Entity\Post;
use App\Form\PostType;
use App\Entity\Comment;
use App\Entity\Category;
use App\Form\CommentType;
use App\Repository\PostRepository;
use App\Repository\CategoryRepository;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Http\Attribute\IsGranted;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class PostController extends AbstractController
{
    #[Route('/', name: 'home')]
    public function index(PostRepository $postRepository, CategoryRepository $categoryRepository): Response
    {
        //$posts = $postRepository->findAll();
        $posts = $postRepository->findLastPosts();
        //dd($posts);
        
        $oldPosts = $postRepository->findOldPosts();

        $categories = $categoryRepository->findAll();

        return $this->render('post/index.html.twig', [
            'posts' => $posts,
            'oldPosts' => $oldPosts,
            'categories' => $categories
        ]);
    }

    #[Route('/category/{slug}', name: 'post_category')]
    public function post_category(Category $category): Response
    {
        //dd($category->getPosts());
        return $this->render('post/category.html.twig', [
            //'posts' => $category->getPosts(),
            'category' => $category
        ]);
    }

    #[IsGranted('ROLE_USER')]
    #[Route('/post/add', name: 'post_add')]
    public function addPost(Request $request, ManagerRegistry $doctrine): Response
    {
        $post = new Post();
        $form = $this->createForm(PostType::class, $post);

        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            $post->setUser($this->getUser());
            $post->setActive(false);
            $em = $doctrine->getManager();
            $em->persist($post);
            $em->flush();
            return $this->redirectToRoute('home');
        }
        
        return $this->render('post/add.html.twig', [
            'form' => $form->createView(),
        ]);
    }
    
    #[Route('/post/{slug}', name: 'post_view')]
    public function post_view(Post $post, Request $request, ManagerRegistry $doctrine): Response
    {
        $comment = new Comment();
        $form = $this->createForm(CommentType::class, $comment);

        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            $comment->setUser($this->getUser());
            $comment->setPost($post);
            $em = $doctrine->getManager();
            $em->persist($comment);
            $em->flush();
            return $this->redirectToRoute('post_view', array('slug' => $post->getSlug()));
        }

        return $this->render('post/view.html.twig', [
            'post' => $post,
            'form' => $form,
        ]);
    }

    #[Route('/post2/{id}', name: 'post2_view')]
    public function post_view2($id, PostRepository $postRepository): Response
    {
        //dd($id);
        $post = $postRepository->find($id);
        //dd($post);

        return $this->render('post/view.html.twig', [
            'post' => $post,
        ]);
    }

    #[Route('/test', name: 'test')]
    public function test(PostRepository $postRepository): Response
    {
        //$posts = $postRepository->findOldPosts();
        //$posts = $postRepository->findLastPosts();
        $counts = $postRepository->nbAllSubjects();
        dd($counts);
    }

}
