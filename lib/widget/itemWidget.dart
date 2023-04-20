
import 'package:flutter/material.dart';

import '../core/model/curency_model.dart';

class ItemWidget extends StatefulWidget {
  CurrencyModel model;
   ItemWidget({Key? key, required this.model}) : super(key: key);

  @override
  State<ItemWidget> createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  TextEditingController itemOneController = TextEditingController();
  TextEditingController itemTwoController = TextEditingController();
  bool items = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      child: Builder(
        builder: (context) {
          return Container(
            height: (items)?120:150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              //     boxShadow: const [
              //   BoxShadow(color: Colors.black26,)
              // ]
            ),
            child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22),
                    side: const BorderSide(color: Colors.black)),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    widget.model.ccyNm,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700),
                                    textAlign: TextAlign.start,
                                  ),
                                  Text(
                                    " ${widget.model.diff[0] == "-"?"${widget.model.diff}":"+${widget.model.diff}"}",
                                    style: TextStyle(
                                        color: widget.model.diff[0]=="-"?Colors.red:Colors.greenAccent.shade200,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "${widget.model.nominal} ${widget.model.ccy}  =  ${widget.model.rate} UZS\n "
                                    "${widget.model.date}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: Colors.black87,
                                ),
                              )
                            ],
                          ),
                          const Spacer(),
                          Column(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      items = !items;
                                    });
                                  },
                                  icon: (items)? const Icon(
                                    Icons.arrow_drop_down,
                                    size: 40,
                                  ):Icon(
                                    Icons.arrow_drop_up,
                                    size: 40,
                                  )
                              )
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),(!items)?
                      GestureDetector(
                        onTap: () {
                          _showBottomSheet(context, widget.model);
                        },
                        child: Container(
                          width: 120,
                          height: 30,
                          decoration: BoxDecoration(
                              color: Colors.deepPurple.shade500,
                              borderRadius: BorderRadius.circular(8)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.calculate,
                                size: 20,
                                color: Colors.white,
                              ),
                              Text(
                                "Hisoblash",
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ):Container()
                    ],
                  ),
                )),
          );
        }
      ),
    );
  }
  void _showBottomSheet(BuildContext contextx, CurrencyModel model) {
    showModalBottomSheet(
      context: contextx,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25))),
      isDismissible: false,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  itemOneController.clear();
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 10,
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.shade300),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 18.0),
                child: Text(
                  model.ccyNm,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Builder(
                        builder: (context) {

                          return TextFormField(
                            controller: itemOneController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                hintText: model.nominal,
                                labelText: model.nominal,
                                border: OutlineInputBorder()),
                          );
                        }
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Builder(
                        builder: (context) {
                          if(itemOneController.text.length >=1){
                            return TextField(
                              readOnly: true,
                              controller: itemTwoController,
                              decoration: InputDecoration(

                                  labelText: calculate(model.rate,itemOneController.text), border: OutlineInputBorder()),
                            );
                          } else {
                            return TextField(
                              readOnly: true,
                              controller: itemTwoController,
                              decoration: InputDecoration(
                                  labelText: model.rate, border: OutlineInputBorder()),
                            );
                          }
                        }
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
  String calculate (String sum1, String sum2) {
    double t = double.parse(sum1);
    double t2 = double.parse(sum2);
    return "${t*t2}";
  }
}
