use std::iter::FromIterator;

pub struct SimpleLinkedList<T> {
    head: Option<Box<Node<T>>>,
}

struct Node<T> {
    data: T,
    next: Option<Box<Node<T>>>,
}

impl<T> SimpleLinkedList<T> {
    pub fn new() -> Self {
        SimpleLinkedList { head: None }
    }

    pub fn len(&self) -> usize {
        let mut length = 0;
        let mut head = &self.head;

        while let Some(node) = head {
            length += 1;
            head = &node.next;
        }

        length
    }

    pub fn push(&mut self, _element: T) {
        self.head = Some(Box::new(Node {
            data: _element,
            next: self.head.take(),
        }));
    }

    pub fn pop(&mut self) -> Option<T> {
        self.head.take().and_then(|node| {
            self.head = node.next;
            Some(node.data)
        })
    }

    pub fn peek(&self) -> Option<&T> {
        self.head.as_ref().map(|node| &node.data)
    }

    pub fn rev(self) -> SimpleLinkedList<T> {
        let mut list = Self::new();
        let mut head = self.head;

        while let Some(node) = head {
            list.push(node.data);
            head = node.next;
        }

        list
    }
}

impl<T> FromIterator<T> for SimpleLinkedList<T> {
    fn from_iter<I: IntoIterator<Item = T>>(_iter: I) -> Self {
        let mut list = Self::new();

        for item in _iter {
            list.push(item);
        }

        list
    }
}

impl<T> Into<Vec<T>> for SimpleLinkedList<T> {
    fn into(self) -> Vec<T> {
        let mut vec = Vec::new();
        let mut head = self.head;

        while let Some(node) = head {
            vec.push(node.data);
            head = node.next;
        }

        vec.reverse();
        vec
    }
}
