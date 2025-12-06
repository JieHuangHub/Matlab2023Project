function varargout = blazing_spline(varargin)
    %BLAZING_SPLINE [INTERNAL] 
    %
    %  Function = BLAZING_SPLINE(char name, {[double]} knots, struct opts)
    %
    %Construct a specialized parametric BSpline.
    %
    %Specialized in these ways:
    %order 3 is assumed
    %
    %up to dimension 3 supported
    %
    %a single scalar output (m=1)
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_2b9
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/blazing_spline.hpp#L38
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/blazing_spline.cpp#L38-L42
    %
    %
    %
  [varargout{1:nargout}] = casadiMEX(921, varargin{:});
end
