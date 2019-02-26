================================
Xcode Project Requirements:
================================
XCode supporting iOS 10 and above (builds with Xcode 9.3 and above)

=================================
Project Architecture:
=================================

This project is build in MVVM design pattern


Description of each Class:

=================
Model:
=================

SMBook: Book object containing book title, thumbnail and list of authors

==================
ViewModel:
==================

SMBookSearchViewModel:  View Model will make Google books API call and configure the list that is displayed on SMBookSearchVieController

==================
View:
==================

SMBookSearchViewcontroller: Contains Textfield to search a book from google books. Search will be triggered when the number of characters are greater than 3 inorder to limit the number of API call that are triggered

SMBookCell: UICollectionviewCell helpful to populate the data obtained from API

===================
NetworkLayer:
===================

SMHttpSessionClient: Makes API calls using NSURLSession

SMBooksApiManager: Contains the relevant API call that we need to hit the volumes end point
