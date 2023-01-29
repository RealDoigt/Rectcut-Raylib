module to_raylib_rect;
import rectcut;
import raylib;

auto rectcutToRectangle(RectCut!float r)
{
    auto width = r.maxX - r.minX, height = r.maxY - r.minY;
    return Rectangle(r.minX, r.minY, width, height);
}

auto rectangleToRectcut(Rectangle r)
{
    auto maxX = r.x + width, maxY = r.height + r.y;
    return RectCut!float(r.x, r.y, maxX, maxY);
}