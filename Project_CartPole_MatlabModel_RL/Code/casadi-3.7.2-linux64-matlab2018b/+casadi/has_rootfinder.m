function varargout = has_rootfinder(varargin)
    %HAS_ROOTFINDER [INTERNAL] 
    %
    %  bool = HAS_ROOTFINDER(char name)
    %
    %Check if a particular plugin is available.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/rootfinder.hpp#L99
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/rootfinder.cpp#L99-L101
    %
    %
    %
  [varargout{1:nargout}] = casadiMEX(883, varargin{:});
end
