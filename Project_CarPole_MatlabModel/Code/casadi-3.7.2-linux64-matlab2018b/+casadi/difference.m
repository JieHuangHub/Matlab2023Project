function varargout = difference(varargin)
    %DIFFERENCE \\bried Return all elements of a that do not occur in b, preserving 
    %
    %  {MX} = DIFFERENCE({MX} a, {MX} b)
    %
    %order
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L911
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/mx.hpp#L911-L913
    %
    %
  [varargout{1:nargout}] = casadiMEX(942, varargin{:});
end
