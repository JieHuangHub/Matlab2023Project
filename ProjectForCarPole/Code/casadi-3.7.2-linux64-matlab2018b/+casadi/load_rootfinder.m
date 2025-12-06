function varargout = load_rootfinder(varargin)
    %LOAD_ROOTFINDER [INTERNAL] 
    %
    %  LOAD_ROOTFINDER(char name)
    %
    %Explicitly load a plugin dynamically.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/rootfinder.hpp#L103
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/rootfinder.cpp#L103-L105
    %
    %
    %
  [varargout{1:nargout}] = casadiMEX(884, varargin{:});
end
