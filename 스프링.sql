<<<<<<< HEAD
--�� �����̼�
CREATE TABLE ��
(
    �����̵� VARCHAR2(30) PRIMARY KEY,
    ���̸� VARCHAR2(30),
    ���� NUMBER(3),
    ��� CHAR(1),
    ���� VARCHAR2(5),
    ������ NUMBER(7)
    
);

--�ֹ� �����̼�
CREATE TABLE �ֹ�
(
    �ֹ���ȣ NUMBER PRIMARY KEY,
    �ֹ��� VARCHAR2(30) REFERENCES ��(�����̵�), --�ܷ�Ű(�����̺��� �����̵� Į���� ����), FOREIGN KEY(FK)
    �ֹ���ǰ VARCHAR2(20),
    ���� NUMBER,
    �ܰ� NUMBER,
    �ֹ����� DATE
)
DROP TABLE ��
=======
--�� �����̼�
CREATE TABLE ��
(
    �����̵� VARCHAR2(30) PRIMARY KEY,
    ���̸� VARCHAR2(30),
    ���� NUMBER(3),
    ��� CHAR(1),
    ���� VARCHAR2(5),
    ������ NUMBER(7)
    
);

--�ֹ� �����̼�
CREATE TABLE �ֹ�
(
    �ֹ���ȣ NUMBER PRIMARY KEY,
    �ֹ��� VARCHAR2(30) REFERENCES ��(�����̵�), --�ܷ�Ű(�����̺��� �����̵� Į���� ����), FOREIGN KEY(FK)
    �ֹ���ǰ VARCHAR2(20),
    ���� NUMBER,
    �ܰ� NUMBER,
    �ֹ����� DATE
)
DROP TABLE ��
>>>>>>> 3ab24fe7a8892d50c96c087fb5395e3e58472f78
    