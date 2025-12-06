function varargout = has_conic(varargin)
    %HAS_CONIC [INTERNAL] 
    %
    %  bool = HAS_CONIC(char name)
    %
    %Check if a particular plugin is available.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/conic.hpp#L32
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/conic.cpp#L32-L34
    %
    %
  [varargout{1:nargout}] = casadiMEX(859, varargin{:});
end
