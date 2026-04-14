# Réponses — Évaluation Séance 3

## Développement d'applications mobiles — Bachelor 2 Informatique

> **VERNAGEAU / Lucas :**  
> **Date :** 14 avril 2026

---

## Question 1 — StatefulWidget vs StatelessWidget

> Pourquoi l'écran de la todo list est-il un `StatefulWidget` et non un `StatelessWidget` ?  
> Que se passerait-il concrètement si on avait utilisé un `StatelessWidget` à la place ?

_Votre réponse (3 à 5 lignes) :_

Une todo list a besoin de modifier les éléments qui sont affiché en continu, un StatelessWidget ne permet pas de modifier l'état de la todo list par rapport à un StatefulWidget. Donc avec un StatelessWidget tout sera affiché comme au lancement de la page avec aucune modification possible.

---

## Question 2 — Le rôle de setState

> Que fait exactement `setState` dans le cycle de vie d'un widget Flutter ?  
> Que se passe-t-il si on modifie la liste de tâches (ajout, suppression, toggle) **sans** appeler `setState` ?

_Votre réponse (3 à 5 lignes) :_

setState permet de modifier une valeur et de notifier à l'appli qu'une valeur qui est affiché est modifié et qu'il faut donc actualiser la page pour pouvoir afficher cette nouvelle valeur.
Ne pas utiliser setState signifie donc que la page ne va jamais s'actualiser/se reconstruire et ne peut donc pas afficher les nouvelles valeurs.

---

## Question 3 — La pile de navigation

> Expliquez le mécanisme de la pile de navigation Flutter.  
> Quand on navigue vers l'écran Statistiques, puis qu'on revient : que se passe-t-il en mémoire avec les écrans ? L'écran principal est-il reconstruit ?

_Votre réponse (3 à 5 lignes) :_

La pile de navigation Flutter signifie que pour aller sur une nouvelle page celle ci va s'ajouter/se mettre sur la page où on se trouve actuellement. Ces pages vont donc se superposer, si on retourne en arrière la page qu'on vient d'ajouter à notre pile va être retiré/dépilé pour afficher à nouveau la page où on se trouvait. Cette page même s'il n'est pas affiché car en bas de la pile reste quand même construite.

---

## Question 4 — Bug de déclaration

> Un étudiant déclare son `TextEditingController` **à l'intérieur** de la méthode `build()` au lieu de le déclarer comme variable d'instance dans le `State`. Son champ de texte semble se comporter bizarrement.
>
> Expliquez le problème que cela pose et pourquoi.

_Votre réponse (3 à 5 lignes) :_

Parce que le controller correspond aussi à un state, on doit donc le déclarer dans la classe state et pas dans la classe build du widget. Autrement on ne pourra pas utiliser la valeur du controller ou la "dispose".

---

## Question 5 — Choix de conception

> Votre application gère les tâches avec une simple `List` en mémoire. Quand l'utilisateur ferme l'application, toutes les tâches disparaissent.
>
> — Nommez une approche ou un package Flutter qui permettrait de persister les données entre deux lancements de l'app.  
> — Sans écrire de code, expliquez où dans l'architecture de l'app vous feriez les modifications.

_Votre réponse (3 à 5 lignes) :_

On peut utiliser une base de données tels que sqlite pour stocker les données sur le téléphone de l'utilisateur. il faudra donc à chaque chargement de l'application récupérer les données depuis cette base de données et donc changer la façon dont les tâches sont actuellement définis.
