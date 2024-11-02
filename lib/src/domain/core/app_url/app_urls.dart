class AppUrls {
  // ------------------- BASE URL ---------------------------
  static const baseUrl = 'https://flutter-amr.noviindus.in/api';

  static const loginUrl = '$baseUrl/Login';
  static const allMatchesUrl = "$baseUrl/list/matches/all";
  static const shortListUrl = "$baseUrl/create-saved-profile/?";
  static const suggesionsListUrl = "$baseUrl/list/matches/suggested";
  static const newListListUrl = "$baseUrl/list/matches/new";

  static const profileUrl = "$baseUrl/user_profile/?user_id=";

  static const createIntrestUrl = "$baseUrl/create_interest/?receiver_id=";

  static const acceptRejectUrl = "$baseUrl/change_state_request/?";
  static const undoIntrestUrl = "$baseUrl/interest_undo_toggler/";
}

// state=accepted&sent_user_id=12345"
