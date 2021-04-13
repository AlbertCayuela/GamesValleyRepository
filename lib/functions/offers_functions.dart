//offers screen funtions

//function to load more offers when scrolling down
import 'package:games_valley/screens/offers.dart';

loadMoreOffers(int currentMaxNumberOfOffers, List offersList) {
  for (int i = 0; i < currentMaxNumberOfOffers; i++) {
    offersList.add(Offer(title: '${offersList.length}'));
  }

  currentMaxNumberOfOffers += currentMaxNumberOfOffers;
}
