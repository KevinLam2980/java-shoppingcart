-- DELETE
-- FROM cartitems;
--
-- DELETE
-- FROM products;
--
-- DELETE
-- FROM carts;
--
-- DELETE
-- FROM users;
--
-- INSERT INTO USERS(USERID, USERNAME, COMMENTS, CREATED_BY, CREATED_DATE, LAST_MODIFIED_BY, LAST_MODIFIED_DATE)
--      VALUES (1, 'barnbarn', '', 'SYSTEM', CURRENT_TIMESTAMP, 'SYSTEM', CURRENT_TIMESTAMP),
--             (2, 'cinnamon', '', 'SYSTEM', CURRENT_TIMESTAMP, 'SYSTEM', CURRENT_TIMESTAMP),
--             (3, 'stumps', '', 'SYSTEM', CURRENT_TIMESTAMP, 'SYSTEM', CURRENT_TIMESTAMP);
--
-- INSERT INTO PRODUCTS(PRODUCTID, NAME, DESCRIPTION, PRICE, COMMENTS, CREATED_BY, CREATED_DATE, LAST_MODIFIED_BY, LAST_MODIFIED_DATE)
--      VALUES (1, 'PEN', 'MAKES WORDS', 2.50, '', 'SYSTEM', CURRENT_TIMESTAMP, 'SYSTEM', CURRENT_TIMESTAMP),
--             (2, 'PENCIL', 'DOES MATH', 1.50, '', 'SYSTEM', CURRENT_TIMESTAMP, 'SYSTEM', CURRENT_TIMESTAMP),
--             (3, 'COFFEE', 'EVERYONE NEEDS COFFEE', 4.00, '', 'SYSTEM', CURRENT_TIMESTAMP, 'SYSTEM', CURRENT_TIMESTAMP);
--
-- INSERT INTO CARTS(CARTID, USERID, CREATED_BY, CREATED_DATE, LAST_MODIFIED_BY, LAST_MODIFIED_DATE)
--      VALUES (1, 1, 'SYSTEM', CURRENT_TIMESTAMP, 'SYSTEM', CURRENT_TIMESTAMP),
--             (2, 1, 'SYSTEM', CURRENT_TIMESTAMP, 'SYSTEM', CURRENT_TIMESTAMP),
--             (3, 3, 'SYSTEM', CURRENT_TIMESTAMP, 'SYSTEM', CURRENT_TIMESTAMP);
--
-- INSERT INTO CARTITEMS(CARTID, PRODUCTID, QUANTITY, COMMENTS, CREATED_BY, CREATED_DATE, LAST_MODIFIED_BY, LAST_MODIFIED_DATE)
--      VALUES (1, 1, 4, '', 'SYSTEM', CURRENT_TIMESTAMP, 'SYSTEM', CURRENT_TIMESTAMP),
--             (1, 2, 3, '', 'SYSTEM', CURRENT_TIMESTAMP, 'SYSTEM', CURRENT_TIMESTAMP),
--             (1, 3, 2, '', 'SYSTEM', CURRENT_TIMESTAMP, 'SYSTEM', CURRENT_TIMESTAMP),
--             (2, 3, 1, '', 'SYSTEM', CURRENT_TIMESTAMP, 'SYSTEM', CURRENT_TIMESTAMP),
--             (3, 3, 17, '', 'SYSTEM', CURRENT_TIMESTAMP, 'SYSTEM', CURRENT_TIMESTAMP);


/*
We must tell hibernate the ids that have already been used.
The number must be larger than the last used id.
15 > 3 so we are good!
 */

-- alter sequence hibernate_sequence restart with 15;

DELETE
FROM cartitems;

DELETE
FROM products;

DELETE
FROM carts;

DELETE
FROM userroles;

DELETE
FROM users;

DELETE
FROM roles;

INSERT INTO USERS(USERID, USERNAME, PASSWORD, COMMENTS, CREATED_BY, CREATED_DATE, LAST_MODIFIED_BY, LAST_MODIFIED_DATE)
     VALUES (1, 'barnbarn', '$2y$12$3jkQBYZpeKKDSDA1Ws1uzuhIAztEnI8UyRZHQ98pTij7xxp6RtlI2', '', 'SYSTEM', CURRENT_TIMESTAMP, 'SYSTEM', CURRENT_TIMESTAMP),
            (2, 'cinnamon', '$2y$12$5EhoDOj2oGGEhmW8UFwh6e5an6WZ/IaoDPCux0oN4x4pwLm0pj6lq', '', 'SYSTEM', CURRENT_TIMESTAMP, 'SYSTEM', CURRENT_TIMESTAMP),
            (3, 'stumps', '$2y$12$1J5duOYDY4qZZfkOSQwSi.kps8UdatRiw835XN6TL4Vw6f6ioVFBW', '', 'SYSTEM', CURRENT_TIMESTAMP, 'SYSTEM', CURRENT_TIMESTAMP);

INSERT INTO ROLES(ROLEID, NAME, CREATED_BY, CREATED_DATE, LAST_MODIFIED_BY, LAST_MODIFIED_DATE)
     VALUES (1, 'ADMIN', 'SYSTEM', CURRENT_TIMESTAMP, 'SYSTEM', CURRENT_TIMESTAMP),
            (2, 'USER',  'SYSTEM', CURRENT_TIMESTAMP, 'SYSTEM', CURRENT_TIMESTAMP);

INSERT INTO USERROLES(USERID, ROLEID, CREATED_BY, CREATED_DATE, LAST_MODIFIED_BY, LAST_MODIFIED_DATE)
     VALUES (1, 1, 'SYSTEM', CURRENT_TIMESTAMP, 'SYSTEM', CURRENT_TIMESTAMP),
            (2, 1, 'SYSTEM', CURRENT_TIMESTAMP, 'SYSTEM', CURRENT_TIMESTAMP),
            (2, 2, 'SYSTEM', CURRENT_TIMESTAMP, 'SYSTEM', CURRENT_TIMESTAMP),
            (3, 2, 'SYSTEM', CURRENT_TIMESTAMP, 'SYSTEM', CURRENT_TIMESTAMP);

INSERT INTO PRODUCTS(PRODUCTID, NAME, DESCRIPTION, PRICE, COMMENTS, CREATED_BY, CREATED_DATE, LAST_MODIFIED_BY, LAST_MODIFIED_DATE)
     VALUES (1, 'PEN', 'MAKES WORDS', 2.50, '', 'SYSTEM', CURRENT_TIMESTAMP, 'SYSTEM', CURRENT_TIMESTAMP),
            (2, 'PENCIL', 'DOES MATH', 1.50, '', 'SYSTEM', CURRENT_TIMESTAMP, 'SYSTEM', CURRENT_TIMESTAMP),
            (3, 'COFFEE', 'EVERYONE NEEDS COFFEE', 4.00, '', 'SYSTEM', CURRENT_TIMESTAMP, 'SYSTEM', CURRENT_TIMESTAMP);

INSERT INTO CARTS(CARTID, USERID, CREATED_BY, CREATED_DATE, LAST_MODIFIED_BY, LAST_MODIFIED_DATE)
     VALUES (1, 1, 'SYSTEM', CURRENT_TIMESTAMP, 'SYSTEM', CURRENT_TIMESTAMP),
            (2, 1, 'SYSTEM', CURRENT_TIMESTAMP, 'SYSTEM', CURRENT_TIMESTAMP),
            (3, 3, 'SYSTEM', CURRENT_TIMESTAMP, 'SYSTEM', CURRENT_TIMESTAMP);

INSERT INTO CARTITEMS(CARTID, PRODUCTID, QUANTITY, COMMENTS, CREATED_BY, CREATED_DATE, LAST_MODIFIED_BY, LAST_MODIFIED_DATE)
     VALUES (1, 1, 4, '', 'SYSTEM', CURRENT_TIMESTAMP, 'SYSTEM', CURRENT_TIMESTAMP),
            (1, 2, 3, '', 'SYSTEM', CURRENT_TIMESTAMP, 'SYSTEM', CURRENT_TIMESTAMP),
            (1, 3, 2, '', 'SYSTEM', CURRENT_TIMESTAMP, 'SYSTEM', CURRENT_TIMESTAMP),
            (2, 3, 1, '', 'SYSTEM', CURRENT_TIMESTAMP, 'SYSTEM', CURRENT_TIMESTAMP),
            (3, 3, 17, '', 'SYSTEM', CURRENT_TIMESTAMP, 'SYSTEM', CURRENT_TIMESTAMP);


/*
We must tell hibernate the ids that have already been used.
The number must be larger than the last used id.
15 > 3 so we are good!
 */

alter sequence hibernate_sequence restart with 15;

