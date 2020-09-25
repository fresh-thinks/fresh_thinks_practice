class StringCollection {
  //title message
  static String title = "FreshThinks";
  static String title_ = "Fresh Thinks";

  static String or = "or";

  //Splash Screen Messages
  static String splashScreenMessageOne = "Get truly fresh directly from farms";
  static String splashScreenMessageTwo = "Subscribe periodically";
  static String splashScreenMessageThree = "Order by recipe";

  //Welcome Screen Messages
  static String tagLine = "From our Ideas to the food We Deliver";

  // Button Text Strings
  static String loginButton = "Log In";
  static String signUpButton = "Sign Up";
  static String letsStart = "Let's get Started";
  static String request = "Request";

  //Customer Service Messages
  static String submitComplain = "Submit Complain";
  static String customerService = "Customer Service";
  static String complaintsFeedback = "Give you Complaints and Feedback";
  static String requestCall = "Request a Call from Fresh Thinks";
  static String requestCallback = "Request For callback";
  static String callbackRequested = "will soon get in touch with you";
  static String complaintsubmitted_one = "Your Complaint is ";
  static String complaintsubmitted_two = "successfully submitted to";

  //Terms & Conditions Messages
  static String termsCondtions = "Terms and Conditions";
  static String heading1 = "Lorem Ipsum";
  static String paragraph1 =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";

  //Address Book
  static String addNewAddress = "Add New Address";

  //FAQs
  static String faq = "Frequently Asked Questions";
  static List<String> questions;
  static List<String> answers;

  static createList() {
    questions = List<String>();
    questions.add("Can I purchase a gift certificate?");
    questions.add("Can I purchase a gift certificate?");
    questions.add("Can I purchase a gift certificate?");

    answers = List<String>();
    answers.add(paragraph1);
    answers.add(paragraph1);
    answers.add(paragraph1);
  }
}