module to_raylib_rect;
import rectcut;
import raylib;

auto rectcutToRect(RectCut!float r)
{
    auto width = r.maxX - r.minX, height = r.maxY - r.minY;
    return Rect(r.minX, r.minY, width, height);
}

auto rectToRectcut(Rect r)
{
    auto maxX = r.x + width, maxY = r.height + r.y;
    return RectCut!float(r.x, r.y, maxX, maxY);
}