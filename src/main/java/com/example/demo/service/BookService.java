package com.example.demo.service;

import com.example.demo.model.Book;
import com.example.demo.repository.BookRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BookService {
    @Autowired
    private BookRepository bookRepository;

//    public List<Book> searchBooks(String query, String author, String genre) {
//        if (query == null && author == null && genre == null) {
//            // if all query parameters are empty, return all books
//            return bookRepository.findAll();
//        }
//        return bookRepository.findByNameContainingIgnoreCaseOrAuthorContainingIgnoreCaseOrGenreContainingIgnoreCase(query, author, genre);
//    }

    public Book saveBook(Book book) {
        return bookRepository.save(book);
    }

    public List<Book> findAll() {
        return bookRepository.findAll();
    }




}


