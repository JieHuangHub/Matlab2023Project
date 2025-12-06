function varargout = has_interpolant(varargin)
    %HAS_INTERPOLANT [INTERNAL] 
    %
    %  bool = HAS_INTERPOLANT(char name)
    %
    %Check if a particular plugin is available.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/interpolant.hpp#L34
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/interpolant.cpp#L34-L36
    %
    %
    %
  [varargout{1:nargout}] = casadiMEX(918, varargin{:});
end
