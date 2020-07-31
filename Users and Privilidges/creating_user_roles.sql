# Creating Admin User - 

CREATE USER Admin IDENTIFIED BY 'JSjsc@67kasNW';

GRANT ALL
	ON *.*
    TO Admin;

# Creating Client User - 

CREATE USER Client IDENTIFIED BY 'ASwdnj!&dwKN';

GRANT SELECT, INSERT, UPDATE, DELETE, EXECUTE 
	ON airline_management_system.*
    TO Client;