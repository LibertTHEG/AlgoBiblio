UNIT u_adherent;
INTERFACE
	CONST
		Cmax = 100;
		
	TYPE	
		Tadresse = record
			rue : string;
			numeroRue : string;
			npa : string;
			ville : string;
			pays : string;
		END;
		
		Tadherent = record
		    codeAdherent : string;
			nom : string;
			prenom : string;
			adresse : Tadresse;
		END;	
		
		TypeTabAdherents = ARRAY[0..Cmax-1] OF Tadherent;
		
		// Demande toutes les informations à l'utilisateur et retourne un nouveau adherent ayant les informations saisies
		FUNCTION saisirAdherent():Tadherent;
		// Affiche toutes les informations de l'adherent
		PROCEDURE afficherAdherent(adherent:Tadherent);
		
IMPLEMENTATION
	
	FUNCTION saisirAdherent():Tadherent;
	VAR
		a : Tadherent;
	BEGIN
		WRITE('Code adherent : ');
		READLN(a.codeAdherent);
		WRITE('Nom : ');
		READLN(a.nom);
		WRITE('Prenom : ');
		READLN(a.prenom);
		
		WRITELN('Adresse : ');
		WRITE('Rue : ');
		READLN(a.adresse.rue);
		WRITE('Numero rue : ');
		READLN(a.adresse.numeroRue);
		WRITE('NPA : ');
		READLN(a.adresse.npa);
		WRITE('Ville : ');
		READLN(a.adresse.ville);
		WRITE('Pays : ');
		READLN(a.adresse.pays);

		saisirAdherent := a;
	END;
	
	// Affiche un message sous forme de titre entouré d'une séquence de caractères sur chaque côté
	PROCEDURE afficherTitre(titre:STRING; sequence: STRING; repetition:INTEGER);
	VAR
		ind : INTEGER;
		decoration : STRING;
	BEGIN
		decoration := '';
		FOR ind := 0 TO repetition DO
		BEGIN
			decoration := decoration + sequence;
		END;
		WRITELN(decoration, ' ', titre, ' ', decoration);
	END;
	
	PROCEDURE afficherAdherent(adherent:Tadherent);
	BEGIN
		afficherTitre('Adherent code "' + adherent.codeAdherent + '"', '=', 10);
		WRITELN(adherent.prenom, ' ', adherent.nom);
		WRITELN(adherent.adresse.rue, ' ', adherent.adresse.numeroRue);
		WRITELN(adherent.adresse.npa, ' ', adherent.adresse.ville, '(', adherent.adresse.pays, ')');
	END;

END.
