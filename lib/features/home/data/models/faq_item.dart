class FAQItem {
  final int number;
  final String question;
  final String answer;
  bool isExpanded;

  FAQItem({
    required this.number,
    required this.question,
    required this.answer,
    this.isExpanded = false,
  });
}
