import raylib;
import rectcut;
import to_raylib_rect;

void main()
{
    InitWindow(1080, 720, "A raylib game");
    SetTargetFPS(60);
    
    Rectangle[] testRects;
    testRects ~= Rectangle(250, 0, 500, 500);
    testRects ~= testRects[0].rectangleToRectcut.getTop(50f).rectcutToRectangle;
    testRects ~= testRects[1].rectangleToRectcut.getRight(150f).rectcutToRectangle;
    testRects ~= testRects[2].rectangleToRectcut.getRight(100f).rectcutToRectangle;
    testRects ~= testRects[2].rectangleToRectcut.getRight(50f).rectcutToRectangle;

    while (!WindowShouldClose)
    {
        BeginDrawing;
        scope (exit) EndDrawing;
        Colors.WHITE.ClearBackground;
        foreach(tr; testRects) DrawRectangleLinesEx(tr, 2f, Colors.RED);
    }
}
