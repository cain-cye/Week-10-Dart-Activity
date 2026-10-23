abstract class Displayable {
  void render();
}

mixin WiFiConnectable {
  void connectToWiFi(String networkName) {
    print("Connected to Wi-Fi network: $networkName");
  }
}

class Whiteboard implements Displayable {
  String color;
  String dimensions;
  String _currentContent;

  Whiteboard({
    required this.color,
    required this.dimensions,
    String initialContent = "Empty",
  }) : _currentContent = initialContent;

  String get currentContent => _currentContent;

  void writeText(String text) {
    _currentContent = text;
    print("Written on $color board: '$text'");
  }

  void eraseContent() {
    _currentContent = "Empty";
    print("The $color board has been erased.");
  }

  @override
  void render() {
    print("[$color Whiteboard ($dimensions)] Content: '$_currentContent'");
  }
}

class InteractiveBoard extends Whiteboard with WiFiConnectable {
  double touchSensitivity;

  InteractiveBoard({
    required String color,
    required String dimensions,
    String initialContent = "Empty",
    required this.touchSensitivity,
  }) : super(color: color, dimensions: dimensions, initialContent: initialContent);

  @override
  void render() {
    print("[Digital Interactive Smart Board ($dimensions)] Touch Sensitivity: ${touchSensitivity}x | Content: '$currentContent'");
  }

  void saveToCloud() {
    print("Board session content successfully saved to Cloud Storage.");
  }
}

class MagneticBoard extends Whiteboard {
  int maxMagnetCapacity;

  MagneticBoard({
    required String color,
    required String dimensions,
    String initialContent = "Empty",
    required this.maxMagnetCapacity,
  }) : super(color: color, dimensions: dimensions, initialContent: initialContent);

  @override
  void render() {
    print("[$color Magnetic Board ($dimensions)] Holds up to $maxMagnetCapacity magnets | Content: '$currentContent'");
  }

  void attachMagnet(String accessoryName) {
    print("Attached magnetic accessory: '$accessoryName'");
  }
}

void main() {
  InteractiveBoard smartBoard = InteractiveBoard(
    color: "Black",
    dimensions: "65-inch Display",
    initialContent: "Flutter State Management Architecture",
    touchSensitivity: 1.5,
  );

  MagneticBoard classroomBoard = MagneticBoard(
    color: "Green",
    dimensions: "4x8 feet",
    initialContent: "Weekly Class Schedule",
    maxMagnetCapacity: 10,
  );

  print("Testing Polymorphism (Displayable / Render)");
  List<Displayable> displayList = [smartBoard, classroomBoard];
  for (var item in displayList) {
    item.render();
  }

  print("\nTesting Specific Derived Class Behaviors");
  smartBoard.writeText("Updated: Week 10 Async Concepts");
  smartBoard.connectToWiFi("NTC - CLG");
  smartBoard.saveToCloud();

  print("");
  classroomBoard.attachMagnet("Eraser Holder");
  classroomBoard.eraseContent();

  print("\nFinal Rendered State");
  for (var item in displayList) {
    item.render();
  }
}
