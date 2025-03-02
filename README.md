# Ai Weather
## collection files
lib
    -core
        -app_route->contain package go_route to make move on screen to screen  
        -dl->dependency injection used to (GetIt)
        -firebase->functions Firebase Auth (login/sign in/sign out)
        -assets->contain constant varibles used to application
        -network->contain 2 files frist file (dio) used to get and post to api / second file used to get current location
    -features
        -Auth
            -data layer -> Used to send data to Firebase Auth and get the result (success/failure)
            -domain layer-> It is used to prepare user-entered data from the UI and send it to the data layer.
            -presention-> Display the UI to the user and take user input and send it to the domain layer via controller.
        -Weather
            -data layer -> Used to data from weather api 
            -domain layer-> It is used to prepare data from the data layer and send it to the UI.
            -presention-> Display the UI to the user and take data from the domain layer via controller.      
           
