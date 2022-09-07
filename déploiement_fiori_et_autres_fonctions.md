I/ Pour le déploiement de l'app FIORI Elements


Préparer la configuration Launchpad  à ajouter à l'application
npx fiori add flp-config


Collecter la configuration sur le déploiement
npm run deploy-config

Générer une version buildée de l'application 
npm run build

Lancer le déploiement vers MSG (SAP)
npm run deploy


----------------------------------------------------------------------

II/ Cours SAP pertinents

  Developing and Extending SAP Fiori Elements Apps
  https://open.sap.com/courses/fiori-ea1

------  
  Cours : Building Apps with RAP
  https://open.sap.com/courses/cp13
  
----- Créer un package pour démarrer les exercices sur MSG/MS4
Dans ADT Eclipse
	1. Ajouter la classe /dmo/cl_fe_travel_generator à vos objets favoris
	2. Lancer le run de cette classe (F9)

Résultat : Le package nécessaire pour faire les exercices Fiori Elements du cours SAP est créé pour vous
 SAP Fiori elements exercise generator 
 ------------------------------------- 
 The following package got created for you and includes everything you need: ZFE_TRAVEL_0004 
 In the "Project Explorer" right click on "Favorite Packages" and click on "Add Package...". Enter "ZFE_TRAVEL_0004" and click OK. 
 Enjoy your SAP Fiori elements exercise :) 	
 
III/ RAP Generator
 
 Disponible dans le package ZDMO_RAP_GENERATOR
 
 Blog sur le sujet : https://blogs.sap.com/2020/05/17/the-rap-generator/
 
 