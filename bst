#include <iostream>
using namespace std;

template <typename T>
class BST {
private:
    struct Node {
        T data;
        Node* left;
        Node* right;

        Node(T value) {
            data = value;
            left = nullptr;
            right = nullptr;
        }
    };

    Node* root;

    // Insert Node
    Node* insert(Node* node, T value) {
        if (node == nullptr)
            return new Node(value);

        if (value < node->data)
            node->left = insert(node->left, value);
        else if (value > node->data)
            node->right = insert(node->right, value);

        return node;
    }

    // Search Node
    bool search(Node* node, T value) {
        if (node == nullptr)
            return false;

        if (node->data == value)
            return true;

        if (value < node->data)
            return search(node->left, value);

        return search(node->right, value);
    }

    // Find Minimum Value Node
    Node* findMin(Node* node) {
        while (node && node->left)
            node = node->left;

        return node;
    }

    // Delete Node
    Node* remove(Node* node, T value) {
        if (node == nullptr)
            return nullptr;

        if (value < node->data)
            node->left = remove(node->left, value);

        else if (value > node->data)
            node->right = remove(node->right, value);

        else {
            // No child or one child
            if (node->left == nullptr) {
                Node* temp = node->right;
                delete node;
                return temp;
            }

            if (node->right == nullptr) {
                Node* temp = node->left;
                delete node;
                return temp;
            }

            // Two children
            Node* temp = findMin(node->right);
            node->data = temp->data;
            node->right = remove(node->right, temp->data);
        }

        return node;
    }

    // Traversals
    void inorder(Node* node) {
        if (node == nullptr)
            return;

        inorder(node->left);
        cout << node->data << " ";
        inorder(node->right);
    }

    void preorder(Node* node) {
        if (node == nullptr)
            return;

        cout << node->data << " ";
        preorder(node->left);
        preorder(node->right);
    }

    void postorder(Node* node) {
        if (node == nullptr)
            return;

        postorder(node->left);
        postorder(node->right);
        cout << node->data << " ";
    }

    // Destructor Helper
    void clear(Node* node) {
        if (node == nullptr)
            return;

        clear(node->left);
        clear(node->right);
        delete node;
    }

public:
    BST() {
        root = nullptr;
    }

    ~BST() {
        clear(root);
    }

    void insert(T value) {
        root = insert(root, value);
    }

    bool search(T value) {
        return search(root, value);
    }

    void remove(T value) {
        root = remove(root, value);
    }

    void inorder() {
        inorder(root);
        cout << endl;
    }

    void preorder() {
        preorder(root);
        cout << endl;
    }

    void postorder() {
        postorder(root);
        cout << endl;
    }
};

int main() {

    BST<int> tree;

    // Insert Elements
    tree.insert(50);
    tree.insert(30);
    tree.insert(70);
    tree.insert(20);
    tree.insert(40);
    tree.insert(60);
    tree.insert(80);

    cout << "Inorder Traversal: ";
    tree.inorder();

    cout << "Preorder Traversal: ";
    tree.preorder();

    cout << "Postorder Traversal: ";
    tree.postorder();

    // Search
    cout << "\nSearching for 40: ";
    if (tree.search(40))
        cout << "Found" << endl;
    else
        cout << "Not Found" << endl;

    // Delete
    cout << "\nDeleting 30..." << endl;
    tree.remove(30);

    cout << "Inorder Traversal After Deletion: ";
    tree.inorder();

    return 0;
}
