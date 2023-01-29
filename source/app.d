import raylib;
import rectcut;
import to_raylib_rect;

void main()
{
    InitWindow(1080, 720, "A raylib game");
    SetTargetFPS(60);
    
    Rectangle[] testRects;
    testRects ~= Rectangle(0, 0, 500, 500);
    testRects ~= testRects[0].rectangleToRectcut.getTop(100f).rectcutToRectangle;
    testRects ~= testRects[1].rectangleToRectcut.getLeft(50f).rectcutToRectangle;
    

    while (!WindowShouldClose)
    {
        BeginDrawing;
        scope (exit) EndDrawing;
        Colors.WHITE.ClearBackground;
        foreach(tr; testRects) DrawRectangleLinesEx(tr, 2f, Colors.RED);
    }
}
