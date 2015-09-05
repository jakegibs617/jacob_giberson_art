DROP TABLE IF EXISTS members;

CREATE TABLE mailing_list (
    id SERIAL PRIMARY KEY,
    first_name character varying(255),
    last_name character varying(255),
    email character varying(100),
		comments character varying(1000)
);
