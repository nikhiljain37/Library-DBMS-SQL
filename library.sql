-- Creating the Authors Table
CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY,
    Name VARCHAR(100),
    BirthYear INT
);

-- Creating the Books Table
CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(100),
    AuthorID INT,
    Genre VARCHAR(50),
    YearPublished INT,
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

-- Creating the Members Table
CREATE TABLE Members (
    MemberID INT PRIMARY KEY,
    FullName VARCHAR(100),
    JoinDate DATE
);

-- Creating the Loans Table
CREATE TABLE Loans (
    LoanID INT PRIMARY KEY,
    BookID INT,
    MemberID INT,
    LoanDate DATE,
    ReturnDate DATE,
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);

-- Inserting Authors
INSERT INTO Authors (AuthorID, Name, BirthYear) VALUES 
(1, 'J.K. Rowling', 1965),
(2, 'Chetan Bhagat', 1974),
(3, 'Arundhati Roy', 1961),
(4, 'R.K. Narayan', 1906),
(5, 'Ruskin Bond', 1934),
(6, 'Malala Yousafzai', 1997),
(7, 'Amrita Pritam', 1919),
(8, 'Kiran Nagarkar', 1942),
(9, 'Jhumpa Lahiri', 1967),
(10, 'Devdutt Pattanaik', 1970);

-- Inserting Books
INSERT INTO Books (BookID, Title, AuthorID, Genre, YearPublished) VALUES 
(1, 'Harry Potter and the Sorcerer\'s Stone', 1, 'Fantasy', 1997),
(2, 'Five Point Someone', 2, 'Fiction', 2004),
(3, 'The God of Small Things', 3, 'Fiction', 1997),
(4, 'Malgudi Days', 4, 'Fiction', 1943),
(5, 'The Room on the Roof', 5, 'Fiction', 1956),
(6, 'I Am Malala', 6, 'Biography', 2013),
(7, 'Pinjar', 7, 'Historical Fiction', 1950),
(8, 'Cuckoo\'s Song', 8, 'Fiction', 2015),
(9, 'The Namesake', 9, 'Fiction', 2003),
(10, 'Myth=Mithya', 10, 'Non-Fiction', 2006);

-- Sample Queries

-- 1. Retrieve all books by Indian authors
SELECT b.Title, a.Name 
FROM Books b
JOIN Authors a ON b.AuthorID = a.AuthorID
WHERE a.Name IN ('Chetan Bhagat', 'Arundhati Roy', 'R.K. Narayan', 'Ruskin Bond', 'Amrita Pritam');

-- 2. Count total number of books in the library
SELECT COUNT(*) AS TotalBooks FROM Books;

-- 3. Update a member's name
UPDATE Members SET FullName = 'John Doe' WHERE MemberID = 1;

-- 4. Delete a book by title
DELETE FROM Books WHERE Title = 'Harry Potter and the Sorcerer\'s Stone';

-- 5. Count how many books were published after 2000 '
SELECT COUNT(*) AS RecentBooks
FROM Books WHERE YearPublished > 2000;

-- 6. List all members who joined in 2023
SELECT FullName FROM Members WHERE YEAR(JoinDate) = 2023;
