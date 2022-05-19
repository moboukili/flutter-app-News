class OnBoarding {
  final String title;
  final String image;
  final String text;

  OnBoarding({
    required this.title,
    required this.image,
    required this.text,
  });
}

List<OnBoarding> onboardingContents = [
  OnBoarding(
    title: 'Welcome to\n Self Achievement',
    image: 'assets/image/onboarding_image_1.png',
    text: 'Works to provide reliable and comprehensive lifestyle information to the reader.',
  ),
  OnBoarding(
    title: 'Help you to get fresh News',
    image: 'assets/image/onboarding_image_2.png',
    text: 'Find the latest breaking news and information\n on the top stories.',
  ),
  OnBoarding(
    title: 'What are those different categories of news?',
    image: 'assets/image/onboarding_image_3.png',
    text: 'Coming at it one way, categories might include political, health, sports, arts, and so forth.',
  ),
  OnBoarding(
    title: 'Find latest world news',
    image: 'assets/image/onboarding_image_4.png',
    text: 'Get international news. And see the world from another perspective, go to Accosoi.com.',
  ),
];
