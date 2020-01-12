import 'package:flutter/material.dart';
import 'package:web_example/pages/pr_pages/pr_detail_page.dart';
import 'package:web_example/temp_modes.dart';

class PRListPage extends StatelessWidget {
  _openDetailPage(BuildContext context) {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return PRDetailPage();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: mockPRs.length,
      itemBuilder: (contxt, index) {
        final PR pr = mockPRs[index];
        return Container(
          height: 50,
          color: index % 2 == 0 ? Colors.green[200] : Colors.green[100],
          child: Row(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.open_in_browser),
                onPressed: () {
                  _openDetailPage(context);
                },
              ),
              Expanded(
                child: Text('${pr.id}, ${pr.message}, ${pr.commitNumber}'),
              ),
            ],
          ),
        );
      },
    );
  }
}
