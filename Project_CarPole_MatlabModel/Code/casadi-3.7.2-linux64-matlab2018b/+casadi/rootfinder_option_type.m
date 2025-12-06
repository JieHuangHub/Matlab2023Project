function varargout = rootfinder_option_type(varargin)
    %ROOTFINDER_OPTION_TYPE [INTERNAL] 
    %
    %  char = ROOTFINDER_OPTION_TYPE(char name, char op)
    %
    %Get type info for a particular option.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1u5
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/rootfinder.hpp#L91
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/rootfinder.cpp#L91-L93
    %
    %
    %
  [varargout{1:nargout}] = casadiMEX(881, varargin{:});
end
