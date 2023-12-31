function varargout = GUI1(varargin)
% GUI1 MATLAB code for GUI1.fig
%      GUI1, by itself, creates a new GUI1 or raises the existing
%      singleton*.
%
%      H = GUI1 returns the handle to a new GUI1 or the handle to
%      the existing singleton*.
%
%      GUI1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI1.M with the given input arguments.
%
%      GUI1('Property','Value',...) creates a new GUI1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI1

% Last Modified by GUIDE v2.5 01-Nov-2023 19:50:43

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI1_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI1_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before GUI1 is made visible.
function GUI1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI1 (see VARARGIN)

% Choose default command line output for GUI1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edtA_Callback(hObject, eventdata, handles)
% hObject    handle to edtA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edtA as text
%        str2double(get(hObject,'String')) returns contents of edtA as a double


% --- Executes during object creation, after setting all properties.
function edtA_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edtA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edtB_Callback(hObject, eventdata, handles)
% hObject    handle to edtB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edtB as text
%        str2double(get(hObject,'String')) returns contents of edtB as a double


% --- Executes during object creation, after setting all properties.
function edtB_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edtB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pbtCong.
function pbtCong_Callback(hObject, eventdata, handles)
% hObject    handle to pbtCong (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a = str2num(get(handles.edtA,'String')) ; 
b = str2num(get(handles.edtB,'String')) ; 
kq = a + b ; 
set(handles.sttKQ,'String',kq) ;

% --- Executes on button press in pbtTru.
function pbtTru_Callback(hObject, eventdata, handles)
% hObject    handle to pbtTru (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA) 
a = str2num(get(handles.edtA,'String')) ; 
b = str2num(get(handles.edtB,'String')) ; 
kq = a - b ; 
set(handles.sttKQ,'String',kq) ;

% --- Executes on button press in pbtNhan.
function pbtNhan_Callback(hObject, eventdata, handles)
% hObject    handle to pbtNhan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a = str2num(get(handles.edtA,'String')) ; 
b = str2num(get(handles.edtB,'String')) ; 
kq = a * b ; 
set(handles.sttKQ,'String',kq) ;

% --- Executes on button press in pbtChia.
function pbtChia_Callback(hObject, eventdata, handles)
% hObject    handle to pbtChia (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a = str2num(get(handles.edtA,'String')) ; 
b = str2num(get(handles.edtB,'String')) ; 
kq = a / b ; 
set(handles.sttKQ,'String',kq) ;