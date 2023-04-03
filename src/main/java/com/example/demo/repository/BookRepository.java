package com.example.demo.repository;

import com.example.demo.model.Book;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BookRepository extends JpaRepository<Book, Long> {
    Book findBookById(Long id);

     List<Book> findAll();

     @Query("SELECT b FROM Book b WHERE (b.name LIKE %:query% OR b.author LIKE %:query% OR b.genre LIKE %:query% OR b.shortDescription LIKE %:query%) AND (:author is null OR b.author = :author) AND (:genre is null OR b.genre = :genre)")
    List<Book> searchBooks(@Param("query") String query, @Param("author") String author, @Param("genre") String genre);


}
