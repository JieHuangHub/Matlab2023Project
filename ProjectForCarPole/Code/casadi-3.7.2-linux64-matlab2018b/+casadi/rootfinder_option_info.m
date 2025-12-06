function varargout = rootfinder_option_info(varargin)
    %ROOTFINDER_OPTION_INFO [INTERNAL] 
    %
    %  char = ROOTFINDER_OPTION_INFO(char name, char op)
    %
    %Get documentation for a particular option.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1u6
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/rootfinder.hpp#L95
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/rootfinder.cpp#L95-L97
    %
    %
    %
  [varargout{1:nargout}] = casadiMEX(882, varargin{:});
end
