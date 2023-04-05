<h1>digiHow</h1>
Digital education platform for digital divide.

### Technologies Used ###
- Firebase
- Flutter
- WebRTC
- Google Cloud Platform
- TensorFlow

<p> We used Firebase as backend, Flutter as Frontend, and Google Cloud Platform as Cloud. Firebase is responsible for storing and retrieving the data used by the Flutter app. The Flutter app is the primary component of our architecture. It is responsible for rendering the user interface and handling user interactions. The app consists of a set of screens and widgets that display information to the user and allow them to interact with the data stored in Firebase. And we used Google Cloud Platform to change speech to text, which will be used in future features. We are considering about feature that helpee can talk about their questions before helper helps them with Speech to Text API. Overall, our team has chosen the above products and platforms because they are reliable, easy to use, and provide excellent integration with each other, making it easier to develop and deploy high-quality mobile applications with a scalable structure. </p>

---

### Architecture ###
This project uses the MVVM (Model-View-ViewModel) architecture pattern for Flutter.
'model' folder for model, 'screens' folder is for view, 'view_model' folder for viewModel. 
In 'screens', we divided as helpee and helper folders.

Our architecture follows the MVVM pattern, which helps to separate the concerns of our application into three distinct components, Model, View, and ViewModel. The Model component is responsible for representing the data stored in Firebase. The View component is responsible for displaying the data to the user. The ViewModel component handles logic such as matching logic, login and data store logic and etc. Also, it communicates between the Model and View. 

---

### Features ###
- easy sign-in/sign-up
![simulator_screenshot_473614A3-624E-4A1F-A0E2-D06D8AC95AB1](https://user-images.githubusercontent.com/91544407/229956572-7c3ce48c-f320-48ac-9d15-cf2faa27e078.png)
![simulator_screenshot_7C693974-DA51-49C4-A1C1-52E58BDDBF73](https://user-images.githubusercontent.com/91544407/229956403-6610e8d3-b948-4007-8b27-fd70c2b4c193.png)

- easy reservation for matching with helper
![simulator_screenshot_CE82CE19-446B-410A-B795-9012B8F5664C](https://user-images.githubusercontent.com/91544407/229956608-7b9ac482-f024-4b3a-aec9-b9eb10fff3c1.png)

![simulator_screenshot_248B0683-A2CE-48A7-928E-05C01219C9AB](https://user-images.githubusercontent.com/91544407/229956678-be02bcab-488f-44d0-9faa-dfcfbc3fb996.png)

![simulator_screenshot_63582CFF-C014-460D-BCA4-3C3A63CA2CB3](https://user-images.githubusercontent.com/91544407/229956702-6be8d617-721a-4c65-a8b8-7672d443a852.png)

![simulator_screenshot_8A7E7D10-4800-411D-8162-9BAA32BBA0E7](https://user-images.githubusercontent.com/91544407/229956775-3df8b229-640b-4890-8b66-e2988dc77362.png)

- observer role for privacy issues

![simulator_screenshot_87A1F7A8-2991-4596-A36C-D08012D7044A](https://user-images.githubusercontent.com/91544407/229957072-2a8792b6-86cd-48c0-bb79-3a22f7c3cb95.png)

- easy screen share with webRTC technology
<img width="336" alt="Screenshot 2023-04-05 at 10 34 43 AM" src="https://user-images.githubusercontent.com/91544407/229958607-3867f8ee-34c3-4c8e-8cf0-c8da89457293.png">
---


## Run ##

### Install ###
`flutter pub get`
### Start ###
`flutter run`

We support this application on Android and IOS platform.

We uploaded firebase_option file for demo. For real product, we use production options.
