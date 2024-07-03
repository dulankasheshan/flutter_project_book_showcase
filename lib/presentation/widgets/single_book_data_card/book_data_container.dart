import 'package:flutter/material.dart';

class BookDataContainer extends StatefulWidget {
  final String imageUrl;
  final String bookName;
  final String authorName;
  final double rating;
  final String publishDate;
  final double numberOfPage;
  final String description;

  const BookDataContainer({
  required this.imageUrl,
  required this.bookName,
  required this.authorName,
  required this.rating,
  required this.publishDate,
  required this.numberOfPage,
  required this.description,
  super.key,});

  @override
  State<BookDataContainer> createState() => _BookDataContainerState();
}

class _BookDataContainerState extends State<BookDataContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30, bottom: 20),
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                    widget.imageUrl),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),

          //book name
           Center(
            child: Text(
              '${widget.bookName}',
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          const SizedBox(height: 10,),

          //Author name
           Center(
            child: Text(
              '- ${widget.authorName} -',
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          const SizedBox(height: 10,),
          const Divider(),
          const SizedBox(height: 10,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

              //publish date
               Row(
                children: [
                  const Icon(Icons.calendar_month_rounded),
                  const SizedBox(width: 10,),
                  Text(
                    '${widget.publishDate}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),

              //Rating
              Row(
                children: [
                  const Icon(Icons.star_rate_rounded, color: Colors.orangeAccent),
                  const SizedBox(width: 10),
                  Text(
                    (widget.rating * 5).toStringAsFixed(1),
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              )

            ],
          ),

          const SizedBox(height: 10,),
          const Divider(),
          const SizedBox(height: 10,),

          //Number of page
           Text(
            'Number of Pages: ${widget.numberOfPage.toStringAsFixed(0)}p',
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 18,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 10,),
          const Divider(),
          const SizedBox(height: 10,),

          //description
           Text(
            widget.description,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 20,)
        ],
      ),
    );
  }
}
