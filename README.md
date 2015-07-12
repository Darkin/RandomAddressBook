# RandomAddressBook
Was asked over the weekend to create a simple address book that displayed users generated from api.randomuser.me so that is what I did.
I kept it very simple, no saving, no editing, just grabs the data and displays the results in a master/detail view hierarchy.

A few things to note;

-created this using teh master/detail apple template to keep things easy and organized

-edited the storyboards so it will work on all devices and orientations

-done in a very short weekend as per request

-created a singleton for the operationqueue mostly for the heck of it but also because it keeps the downloads organized

-kept the MVC intact. Data is where the data needs to be and the display is only that. 

Things to improve on later;

-fix up the dictionary reader, make sure it won't crash 

-keep the detail object as an id throughout. The detail view does not need to know it is a dictionary and could probably keep it in an id state past the method calls so it would be more modular

-used blocks for download. Probably would be better if I used delegates but since I have next to no control over the website... 

-better error checking. but again, with limited time and knowledge of the random API, it would need time

-more detail on detail view. I could add pretty much everything that was send (email, phone, etc) but it is not really needed for display purposes

-load circle. Even if it is very quick, users want to know that something is happening and they just need to wait

-better website manipulation, should greate variables to allow you to change the details of the request

-better and more localized constants. Most of the time I create strings as const instead of defines but it is faster that way

