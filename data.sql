USE nette_schuzky
GO

CREATE TABLE sch_organizace
     ( 
        id INT NOT NULL IDENTITY(1,1) PRIMARY KEY CLUSTERED (id ASC), 
        priority INT NOT NULL DEFAULT 0,
        lvl INT NOT NULL  , 
        rodic_id INT NULL,
        nazev VARCHAR(20) NULL  , 
        mesto VARCHAR(30) NULL  , 
        adresa VARCHAR(60) NULL  ,          
     )
GO     
     
CREATE TABLE sch_user
     ( 
        id INT NOT NULL  IDENTITY(1,1) PRIMARY KEY CLUSTERED (id ASC), 
		priority INT NOT NULL DEFAULT 0,  
        organizace_id INT NOT NULL  , 
		username VARCHAR(40) NULL  , 		      
        jmeno VARCHAR(40) NULL  , 
        prijmeni VARCHAR(60) NULL  , 
        tel1 VARCHAR(30) NULL  , 
        tel2 VARCHAR(30) NULL  , 
        fax VARCHAR(30) NULL  , 
        email VARCHAR(60) NULL  , 
        CONSTRAINT FK_user_organizace FOREIGN KEY (organizace_id) REFERENCES sch_organizace(id) on delete cascade on update cascade ,    		
	)     
GO      
     
     

CREATE TABLE sch_schuzka
     ( 
		id INT NOT NULL  IDENTITY(1,1) PRIMARY KEY CLUSTERED (id ASC), 
		priority INT NOT NULL DEFAULT 0,        
        datum DATETIME NOT NULL  ,
        user_id INT NOT NULL  , /*ke komu dana schuzka je*/
        duvod VARCHAR(250) NULL  , 
        CONSTRAINT FK_schuzka_user  FOREIGN KEY (user_id) REFERENCES sch_user(id)  on delete cascade on update cascade 
     )     
GO     

CREATE TABLE sch_poznamka_schuzka
     ( 
		id INT NOT NULL  IDENTITY(1,1) PRIMARY KEY CLUSTERED (id ASC), 
		priority INT NOT NULL DEFAULT 0,  
		schuzka_id INT NOT NULL  ,		      
        datum DATETIME NOT NULL  ,
        duvod VARCHAR(250) NULL  , 
        CONSTRAINT FK_schuzka_poznamka FOREIGN KEY (schuzka_id) REFERENCES sch_schuzka(id)  on delete cascade on update cascade 
	)     
GO 

/*kdo se schuzky ucastni*/
CREATE TABLE sch_schuzka_user_xref
     ( 
		id INT NOT NULL  IDENTITY(1,1) PRIMARY KEY CLUSTERED (id ASC), 
		priority INT NOT NULL DEFAULT 0,  /*priority asi bude udavat, jestli se clovek schuzky ucastnil..*/
		schuzka_id INT NOT NULL  ,		      
		user_id INT NOT NULL  ,	
		CONSTRAINT FK_schuzka_user_schuzka  FOREIGN KEY (schuzka_id) REFERENCES sch_schuzka(id), 
		CONSTRAINT FK_schuzka_user_user  FOREIGN KEY (user_id) REFERENCES sch_user(id)
	)     
GO 














