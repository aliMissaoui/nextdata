/// Base class for OpeningScreen events.
///
/// All events related to the OpeningScreen should extend this class.
abstract class OpeningScreenEvent {}

/// Event for starting the opening of the screen.
///
/// This event handles the start of the screen opening.
class StartOpeningScreenEvent extends OpeningScreenEvent {}
