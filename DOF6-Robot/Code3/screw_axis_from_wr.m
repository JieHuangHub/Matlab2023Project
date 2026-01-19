function S = screw_axis_from_wr(w, r)
% 构造螺旋轴 S = [w; v], v = -w x r
    v = -cross(w, r);
    S = [w; v];
end