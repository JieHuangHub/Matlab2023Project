function varargout = has_nlpsol(varargin)
    %HAS_NLPSOL [INTERNAL] 
    %
    %  bool = HAS_NLPSOL(char name)
    %
    %Check if a particular plugin is available.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/nlpsol.hpp#L35
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/nlpsol.cpp#L35-L37
    %
    %
  [varargout{1:nargout}] = casadiMEX(872, varargin{:});
end
