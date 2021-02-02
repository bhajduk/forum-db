# Forum database

Forum database project to learn MySQL.

![alt text](https://github.com/bhajduk/forum-db/blob/main/schema.svg)

## CRUD examples

#### Phrase search
```sql
SELECT * FROM Post
WHERE content LIKE '%nowa%' OR title LIKE '%nowa%';
```

#### Select user's nick and user's posts and sort by date
```sql
SELECT User.user_id, User.nick, Post.title, Post.Content
FROM (Post INNER JOIN User ON User.user_id = Post.user_id)
WHERE User.user_id = 2
ORDER BY DATE;
```

#### Select all categories and subcategories
```sql
SELECT Category.title, Category.category_id
FROM Category
UNION
SELECT Subcategory.title, Subcategory.category_id
FROM Subcategory;
```

#### Select nick and posts amount from user table and sort by posts amount desc
```sql
SELECT COUNT(Post.post_id), Post.user_id, User.nick
FROM Post
JOIN User
ON User.user_id = Post.user_id
GROUP BY user_id
ORDER BY COUNT(post_id) DESC;
```

#### Select user with largest amount of posts
```sql
SELECT COUNT(Post.post_id), Post.user_id, User.nick
FROM Post
JOIN User
ON User.user_id = Post.user_id
GROUP BY user_id
ORDER BY COUNT(post_id) DESC
LIMIT 1;
```

#### Create new user
```sql
INSERT INTO User (nick, passwd, email, country)
VALUES ('bhaj', 'qwerty', 'bhaj@mail.com', 'Poland');
```

#### Update user password
```sql
UPDATE User
SET passwd = 'nowehaslo'
WHERE nick = 'bhaj';
```

#### Create new post
```sql
INSERT INTO Post (subcategory_id, user_id, title, content, date)
VALUES (9, 1, 'Tytul postu z id', 'Lorem ipsum dolor sit amet', CURRENT_TIMESTAMP);
```

#### Update post content
```sql
UPDATE Post
SET content = 'Nowa tresc postu lorem ipsum dolor sit amet'
WHERE Post.Post_id = 2;
```

#### Delete user's post
```sql
DELETE FROM Post
WHERE user_id = 1 AND post_id = 1; 
```

#### Create new category
```sql
INSERT INTO Category (title, description)
VALUES ('Kategoria 1', 'Lorem ipsum dolor sit amet');
```

#### Create new subcategory
```sql
INSERT INTO Subcategory  (category_id, title, description)
VALUES (1, 'Tytul nowej podkategorii', 'Lorem ipsum dolor sit amet');
```


