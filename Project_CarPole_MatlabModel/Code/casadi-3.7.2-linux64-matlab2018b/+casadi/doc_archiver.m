function varargout = doc_archiver(varargin)
    %DOC_ARCHIVER [INTERNAL] 
    %
    %  char = DOC_ARCHIVER(char name)
    %
    %Get the documentation string for a plugin.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/archiver.hpp#L46
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/archiver.cpp#L46-L48
    %
    %
    %
  [varargout{1:nargout}] = casadiMEX(1209, varargin{:});
end
