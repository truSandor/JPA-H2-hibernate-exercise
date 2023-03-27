drop table if exists author CASCADE;
drop table if exists book CASCADE;
drop table if exists author_books CASCADE;

create table author
(
    id   long generated by default as identity,
    name varchar(255),
    primary key (id)
);
create table book
(
    id    long generated by default as identity,
    title varchar(255),
    author_id long,
    primary key (id)
);

create table books_authors
(
    authors_id long not null,
    books_id  long not null
);

-- alter table book_authors
--     add constraint UK_books unique (books_id);
--
alter table books_authors
    add constraint FK_book_authors_book
        foreign key (books_id)
            references book (id);


alter table books_authors
    add constraint FK_book_authors_author
        foreign key (authors_id)
            references author (id);

-- alter table book
--     add constraint FK_book_author
--         foreign key (author_id)
--             references author;