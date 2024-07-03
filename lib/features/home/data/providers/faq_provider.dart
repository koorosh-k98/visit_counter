import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:visit_counter/constants/strings.dart';
import 'package:visit_counter/features/home/data/models/faq_item.dart';

final faqProvider = Provider<List<FAQItem>>((ref) => [
      FAQItem(
        number: 1,
        question: "How to use it?",
        answer:
            '''Step 1: Go to ${Strings.baseUrl} and tap on '${Strings.generateYourVisitCounter}' button.
Step 2: Enter your favorite username.
Step 3: Change label of the counter. (optional)
Step 4: Select icon style. (optional)
Step 5: Select your favorite color. (optional)
Step 6: By clicking on 'Generate' button you can get Markdown or HTML code.
Finally: Copy it and use it anywhere!''',
      ),
      FAQItem(
        number: 2,
        question: "Which websites I can put this code?",
        answer: '''You can put it anywhere.
Use it on your own Websites, Blog Pages, GitHub ReadMe, Notion, Medium, Dev.to, Hashnode, and literally everywhere!''',
      ),
      FAQItem(
        number: 3,
        question: "Is it free?",
        answer:
            '''Yes, Visit Counter is definitely free to use. All features are available without any restrictions.
If you are satisfied with our product or you want to support us, there is a support button available on top of this page.
We appreciate your support.''',
      ),
    ]);
