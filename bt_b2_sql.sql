create database StudentManagement;
use StudentManagement;

-- bài tập 1: sinh viên và lớp học
create table class (
    classid varchar(20) primary key,    
    classname nvarchar(100) not null,
    academicyear int not null
);

create table student (
    studentid varchar(20) primary key,    
    fullname nvarchar(100) not null,
    dateofbirth date,
    classid varchar(20) references class(classid) 
);


-- bài tập 2: sinh viên và môn học
create table subject (
    subjectid varchar(20) primary key, 
    subjectname nvarchar(100) not null,
    credits int not null check (credits > 0) 
);


-- bài tập 3: đăng ký môn học (quan hệ nhiều - nhiều)
create table enrollment (
    studentid varchar(20) references student(studentid),
    subjectid varchar(20) references subject(subjectid), 
    enrollmentdate date,
    primary key (studentid, subjectid) 
);