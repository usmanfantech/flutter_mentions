part of flutter_mentions;

class OptionList extends StatelessWidget {
  OptionList({
    required this.data,
    required this.onTap,
    required this.suggestionListHeight,
    this.suggestionBuilder,
    this.suggestionListDecoration,
  });

  final Widget Function(Map<String, dynamic>)? suggestionBuilder;

  final List<Map<String, dynamic>> data;

  final Function(Map<String, dynamic>) onTap;

  final double suggestionListHeight;

  final BoxDecoration? suggestionListDecoration;

  @override
  Widget build(BuildContext context) {
    return data.isNotEmpty
        ? Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Container(
              decoration: suggestionListDecoration ??
                  BoxDecoration(color: Colors.white),
              constraints: BoxConstraints(
                maxHeight: suggestionListHeight,
                minHeight: 0,
              ),
              child: ListView.builder(
                itemCount: data.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ElevatedButton(
                    onPressed: () {
                      onTap(data[index]);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                    ),
                    child: suggestionBuilder != null
                        ? suggestionBuilder!(data[index])
                        : Container(
                            color: Colors.blue,
                            padding: EdgeInsets.all(20.0),
                            child: Text(
                              data[index]['display'],
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                  );
                },
              ),
            ),
          )
        : Container();
  }
}
