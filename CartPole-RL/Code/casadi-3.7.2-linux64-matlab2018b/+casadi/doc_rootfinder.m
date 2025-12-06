function varargout = doc_rootfinder(varargin)
    %DOC_ROOTFINDER [INTERNAL] 
    %
    %  char = DOC_ROOTFINDER(char name)
    %
    %Get the documentation string for a plugin.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/rootfinder.hpp#L107
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/rootfinder.cpp#L107-L109
    %
    %
    %
  [varargout{1:nargout}] = casadiMEX(885, varargin{:});
end
