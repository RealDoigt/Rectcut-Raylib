module rectcut;
import std.algorithm;
import std.traits;

struct RectCut(T) if (isNumeric!(T))
{
    enum Side
    {
        left,
        right,
        top,
        bottom
    }

    T minX, minY, maxX, maxY;
    
    auto cut(T a, Side side)
    {
        switch(side)
        {
            case Side.right: return cutRight(a);
            case Side.left:  return cutLeft(a);
            case Side.top:   return cutTop(a);
            default:         return cutBottom(a);
        }
    }
    
    auto cutLeft(T a)
    {
        T originalX = minX;
        minX = min(maxX, minX + a);
        return RectCut(originalX, minY, minX, maxY);
    }
    
    auto cutRight(T a)
    {
        T originalX = maxX;
        maxX = max(minX, maxX - a);
        return RectCut(maxX, minY, originalX, maxY);
    }
    
    auto cutTop(T a)
    {
        T originalY = minY;
        minY = min(maxX, minY + a);
        return RectCut(minX, originalY, maxX, minY);
    }
    
    auto cutBottom(T a)
    {
        T originalY = maxY;
        maxY = max(minY, maxY - a);
        return RectCut(minX, maxY, maxX, originalY);
    }
    
    auto getLeft(T a)
    {
        T newX = min(maxX, minX + a);
        return RectCut(minX, minY, newX, maxY);
    }
    
    auto getRight(T a)
    {
        T newX = max(minX, maxX - a);
        return RectCut(newX, minY, maxX, maxY);
    }
    
    auto getTop(T a)
    {
        T newY = min(maxX, minY + a);
        return RectCut(minX, minY, maxX, newY);
    }
    
    auto getBottom(T a)
    {
        T newY = max(minY, maxY - a);
        return RectCut(minX, newY, maxX, maxY);
    }
    
    auto addLeft(T a)
    {
        return RectCut(minX - a, minY, maxX, maxY);
    }
    
    auto addRight(T a)
    {
        return RectCut(minX, minY, maxX + a, maxY);
    }
    
    auto addTop(T a)
    {
        return RectCut(minX, minY - a, maxX, maxY);
    }
    
    auto addBottom(T a)
    {
        return RectCut(minX, minY, maxX, maxY + a);
    }
    
    auto extend(T a)
    {
        return RectCut(minX - a, minY - a, maxX + a, maxY + a);
    }
    
    auto contract(T a)
    {
        return RectCut(minX + a, minY + a, maxX - a, maxY - a);
    }
    
    void selfExtend(T a)
    {
        minX -= a; 
        minY -= a; 
        maxX += a; 
        maxY += a;
    }
    
    void selfcontract(T a)
    {
        minX += a; 
        minY += a; 
        maxX -= a; 
        maxY -= a;
    }
}
